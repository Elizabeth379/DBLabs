import psycopg2
from datetime import datetime


try:
    connection = psycopg2.connect(
        user="postgres",
        password="12345",
        host="localhost",
        database="zoo"
    )
except:
    print('Can`t establish connection to database')

def register_user():
    print("Registration:")
    username = input("Enter your username: ")
    password = input("Enter your password: ")

    try:
        with connection.cursor() as cursor:
            cursor.execute('INSERT INTO "user" (username, password, fk_role_id) VALUES (%s, %s, %s) RETURNING user_id',
                           (username, password, 3))
            user_id = cursor.fetchone()[0]
            connection.commit()
            print(f"Registration successful! Your user ID is {user_id}.")
            return user_id, username
    except Exception as e:
        print(f"Error: Unable to register user\n{e}")
        return None

def login_user():
    username = input("Enter your username: ")
    password = input("Enter your password: ")

    try:
        with connection.cursor() as cursor:
            cursor.execute('SELECT user_id, fk_role_id FROM "user" WHERE username = %s AND password = %s', (username, password))
            user = cursor.fetchone()

            query = """
                SELECT u.user_id, u.fk_role_id, r.name
                FROM "user" u
                JOIN role r ON u.fk_role_id = r.role_id
                WHERE u.username = %s;
                """
            with connection.cursor() as cursor:
                cursor.execute(query, (username,))
                user = cursor.fetchone()

            if user:
                print(f"Login successful! Your role is {user[2]}.")
                return user[0], username
            else:
                print("Login failed. Invalid username or password.")
                return None

    except Exception as e:
        print(f"Error: Unable to log in\n{e}")

    return None

def check_role(user_id):
    try:
        with connection.cursor() as cursor:
            cursor.execute('SELECT fk_role_id FROM "user" WHERE user_id = %s::integer', (user_id,))
            result = cursor.fetchone()

            if result and result[0] == 1:
                return 1
            elif result and result[0] == 2:
                return 2
            else:
                return 3
    except Exception as e:
        print(f"Error checking user role: {e}")
        return 3


def view_profile(user_id):
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM profile WHERE fk_user_id = %s", (user_id,))
            profile = cursor.fetchone()

            if profile:
                print("Profile:")
                print(f"First name: {profile[3]}")
                print(f"Last name: {profile[4]}")
                print(f"Email: {profile[2]}")
                print(f"Phone number: {profile[1]}")
            else:
                print("Profile not found.")

        connection.commit()
    except Exception as e:
        print(f"Error: Unable to view profile\n{e}")

    connection.commit()

def edit_profile(user_id):
    while True:
        print("Edit Profile:")
        print("1. Change name")
        print("2. Change last name")
        print("3. Change email")
        print("4. Change phone number")
        print("0. Back")

        choice = input("Enter your choice: ")

        try:
            with connection.cursor() as cursor:
                if choice == '1':
                    new_name = input("Enter your new name: ")
                    cursor.execute("UPDATE profile SET first_name = %s WHERE fk_user_id = %s", (new_name, user_id))
                    connection.commit()
                    print("Name updated successfully.")
                elif choice == '2':
                    new_last_name = input("Enter your new last name: ")
                    cursor.execute("UPDATE profile SET last_name = %s WHERE fk_user_id = %s", (new_last_name, user_id))
                    connection.commit()
                    print("Last name updated successfully.")
                elif choice == '3':
                    new_email = input("Enter your new email: ")
                    cursor.execute("UPDATE profile SET email = %s WHERE fk_user_id = %s", (new_email, user_id))
                    connection.commit()
                    print("Email updated successfully.")
                elif choice == '4':
                    new_phone_number = input("Enter your new phone number: ")
                    cursor.execute("UPDATE profile SET phone = %s WHERE fk_user_id = %s",
                                   (new_phone_number, user_id))
                    connection.commit()
                    print("Phone number updated successfully.")
                elif choice == '0':
                    print("Returning to the main menu.")
                    return
                else:
                    print("Invalid choice. Please try again.")
        except Exception as e:
            print(f"Error: Unable to edit profile\n{e}")


def view_animals(user_id):
    try:
        query = """
                SELECT a.animal_id, a.name, a.age, a.description, a.fk_species_name,  a.fk_aviary_id, av.name
                FROM animal a
                JOIN aviary av ON a.fk_aviary_id = av.aviary_id;
                """
        with connection.cursor() as cursor:
            cursor.execute(query)
            animals = cursor.fetchall()

            if animals:
                print("Animals:")
                for animal in animals:
                    print(f"ID: {animal[0]}, Name: {animal[1]}, Age: {animal[2]}, Description: {animal[3]}, Species: {animal[4]}, Aviary: {animal[6]}")

                animal_id = input("Enter the ID of the animal to view what food it prefer (0 to go back): ")

                if animal_id != '0':
                    view_animal_food(user_id, animal_id)
            else:
                print("No animals found.")
    except Exception as e:
        print(f"Error: Unable to view collections\n{e}")


def view_animal_food(user_id, animal_id):
    try:
        with connection.cursor() as cursor:
            cursor.execute('SELECT fk_food_name FROM animal_food WHERE fk_animal_id = %s::integer', (animal_id,))
            food = cursor.fetchall()

            if food:
                print("Food for this animal:")
                for f in food:
                    print(f"{f[0]}")
            else:
                print("No food found.")
    except Exception as e:
        print(f"Error viewing food for animal: {e}")

def view_rewiews(user_id):
    try:
        query = """
               SELECT r.rewiew_id, r.rewiew_text, r.rewiew_time, r.fk_user_id, u.username
               FROM rewiew r
               JOIN "user" u ON r.fk_user_id = u.user_id;
               """
        with connection.cursor() as cursor:
            cursor.execute(query)
            rewiews = cursor.fetchall()

            if rewiews:
                print("Rewiews:")
                for rewiew in rewiews:
                    print(f"ID: {rewiew[0]}, Text: {rewiew[1]}, Date and time: {rewiew[2]}, User: {rewiew[4]}")

                acception = input("Enter 1 to write new rewiew (0 to go back): ")

                if acception == '1':
                    add_rewiew(user_id)
            else:
                print("No rewiews found.")
    except Exception as e:
        print(f"Error: Unable to view rewiews\n{e}")


def add_rewiew(user_id):
    while True:
        text = input("Enter rewiew text: ")
        current_datetime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        try:
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO rewiew (rewiew_text, rewiew_time, fk_user_id) VALUES (%s, %s, %s)",
                               (text, current_datetime, user_id))
                connection.commit()
                print("Rewiew added succesfully!")

                choice = input("Enter 1 to go back to rewiew list or 0 to go back to zoo menu: ")

                if choice == '1':
                    view_rewiews(user_id)
                    return
                elif choice == '0':
                    print("Returning to the main menu.")
                    return
                else:
                    print("Invalid choice. Please try again.")
        except Exception as e:
            print(f"Error: Unable to add rewiew\n{e}")
            return None


def order_food(user_id):
    food_entered = input("Enter food name: ")
    pay_choice = input("Do you want to pay? (yes/no) ")

    while True:
        if pay_choice == 'yes':
            is_paid = True
            break
        elif pay_choice == 'no':
            is_paid = False
            break
        else:
            print("Invalid choice. Please try again.")

    try:
        with connection.cursor() as cursor:
            cursor.execute('SELECT weight FROM food WHERE name = %s', (food_entered,))
            food_weight = cursor.fetchone()

            food_price = int(food_weight[0])/10

            if food_price:
                try:
                    with connection.cursor() as cursor:
                        cursor.execute("INSERT INTO food_order (price, fk_food_name, fk_user_id, is_paid) VALUES (%s, %s, %s, %s)",
                                       (food_price, food_entered, user_id, is_paid))
                        connection.commit()
                        print("Food order succesfully!")

                        choice = input("Enter 1 to go back to food order list or 0 to go back to zoo menu: ")

                        if choice == '1':
                            view_food_orders(user_id)
                            return
                        elif choice == '0':
                            print("Returning to the main menu.")
                            return
                        else:
                            print("Invalid choice. Please try again.")
                except Exception as e:
                    print(f"Error: Unable to add food order\n{e}")
                    return None
            else:
                print("No weight for food found.")
    except Exception as e:
        print(f"Error get food for animal weight: {e}")


def view_food_orders(user_id):
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM food_order WHERE fk_user_id = %s::integer", (user_id,))
            food_orders = cursor.fetchall()

            if food_orders:
                print("Your food orders:")
                for fo in food_orders:
                    print(f"ID: {fo[0]}, Price: {fo[1]}, Food name: {fo[2]}, Is Paid: {fo[4]}")
            else:
                print("No food orders found.")
    except Exception as e:
        print(f"Error: Unable to view food orders\n{e}")

def buy_ticket(user_id):
    while True:
        type = input("Enter ticket type (1- Standart, 2 - VIP, 3 - Student, 4 - Senior): ")
        if type:
            if type == '1':
                price = 30
                break
            elif type == '2':
                price = 50
                break
            elif type == '3':
                price = 25
                break
            elif type == '4':
                price = 15
                break
        else:
            print("Invalid choice. Please try again.")

    try:
        with connection.cursor() as cursor:
            cursor.execute("INSERT INTO ticket (price, fk_ticket_type_id, fk_user_id) VALUES (%s, %s, %s)",
                           (price, type, user_id))
            connection.commit()
            print("Ticket bought succesfully!")

            choice = input("Enter 1 to go to ticket list or 0 to go back to zoo menu: ")

            if choice == '1':
                view_tickets(user_id)
                return
            elif choice == '0':
                print("Returning to the main menu.")
                return
            else:
                print("Invalid choice. Please try again.")
    except Exception as e:
        print(f"Error: Unable to buy ticket\n{e}")
        return None

def view_tickets(user_id):
    try:
        query = """
                SELECT t.ticket_id, t.price, tp.name, t.fk_user_id, t.fk_ticket_type_id
                FROM ticket t
                JOIN ticket_type tp ON t.fk_ticket_type_id = tp.ticket_type_id
                WHERE t.fk_user_id = %s::integer;
                """
        with connection.cursor() as cursor:
            cursor.execute(query, (user_id,))
            tickets = cursor.fetchall()

            if tickets:
                print("Your tickets:")
                for ticket in tickets:
                    print(f"ID: {ticket[0]}, Price: {ticket[1]}, Type: {ticket[2]}")
            else:
                print("No tickets found.")
    except Exception as e:
        print(f"Error: Unable to view tickets\n{e}")


def main():
    user_info = None
    user_role = None

    while True:
        print("\n============================================")
        print("Welcome to the zoo!")
        print("Our adress: 221B Baker Street.")
        print("Working hours: 10:00am - 9:00pm")
        print("============================================")
        print("\nMenu:")

        if user_info:
            print("3. View profile")
            print("4. Edit profile")
            print("5. View animals")
            print("6. View rewiews")
            print("7. Order food")
            print("8. View food orders")
            print("9. Buy ticket")
            print("10. View tickets")
            if user_role in [1, 2]:
                print("11. Edit animal")
                print("12. Edit aviary")
                print("13. Edit species")
                if user_role == 1:
                    print("14. Delete user")
                    print("15. Change user role")
                    print("16. Users history")
            print("0. Logout")
        else:
            print("1. Register")
            print("2. Login")
            print("0. Exit")

        choice = input("Enter your choice: ")

        if choice == '1' and not user_info:
            user_info = register_user()
        elif choice == '2' and not user_info:
            user_info = login_user()
            if user_info:
                user_role = check_role(user_info[0])
        elif user_info and choice in ['3', '4', '5', '6', '7', '8', '9', '10']:
            menu_options_common = {
                '3': view_profile,
                '4': edit_profile,
                '5': view_animals,
                '6': view_rewiews,
                '7': order_food,
                '8': view_food_orders,
                '9': buy_ticket,
                '10': view_tickets
            }
            menu_options_common[choice](user_info[0])

        elif user_info and choice in ['11', '12', '13', '14', '15', '16']:
            if user_role in [1, 2]:
                menu_options_zookeeper = {
                    '11': edit_animal,
                    '12': edit_aviary,
                    '13': edit_species
                }
                if choice in menu_options_zookeeper:
                    menu_options_zookeeper[choice](user_info[0])

                if user_role == 1:
                    menu_options_admin = {
                        '14': delete_user_by_id,
                        '15': change_user_role,
                        '16': view_action_table
                    }
                    if choice in menu_options_admin:
                        menu_options_admin[choice](user_info[0])
            else:
                print("Invalid choice. Please try again.")

        elif user_info and choice == '0':
            print("Logging out.")
            user_info = None
            user_role = None
        elif not user_info and choice == '0':
            print("Exiting the program.")
            break
        else:
            print("Invalid choice. Please try again.")


if __name__ == "__main__":
    main()
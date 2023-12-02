import psycopg2

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


def main():
    user_info = None
    user_role = None

    while True:
        print("\nMenu:")

        if user_info:
            print("3. View profile")
            print("4. Edit profile")
            print("5. View animals")
            print("6. View rewiews")
            print("7. Order food")
            print("8. View food orders")
            print("9. Buy ticket")
            if user_role in [1, 2]:
                print("10. Edit animal")
                print("11. Edit aviary")
                print("12. Edit species")
                if user_role == 1:
                    print("13. Delete user")
                    print("14. Change user role")
                    print("15. Users history")
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
        elif user_info and choice in ['3', '4', '5', '6', '7', '8', '9']:
            menu_options_common = {
                '3': view_profile,
                '4': edit_profile,
                '5': view_animals,
                '6': view_rewiews,
                '7': order_food,
                '8': view_food_orders,
                '9': buy_ticket
            }
            menu_options_common[choice](user_info[0])

        elif user_info and choice in ['10', '11', '12', '13', '14', '15']:
            if user_role in [1, 2]:
                menu_options_zookeeper = {
                    '10': edit_animal,
                    '11': edit_aviary,
                    '12': edit_species
                }
                if choice in menu_options_zookeeper:
                    menu_options_zookeeper[choice](user_info[0])

                if user_role == 1:
                    menu_options_admin = {
                        '13': delete_user_by_id,
                        '14': change_user_role,
                        '15': view_action_table
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
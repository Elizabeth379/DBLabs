![image](https://github.com/Elizabeth379/DBLabs/assets/93152483/001176cf-4529-4dfb-96dd-a22fbde1d21f)
  
Description
Все атрибуты в обязательном порядке содержат поле id.  

Species  
Описывает вид животных в зоопарке. Содержит поля:  
1. name - название вида
2. description - описание вида животных  
Связи:  
OneToMany c Animal  

Animal  
Описывает животное, находящееся в зоопарке. Содержит поля:
1. name - кличка животного
2. species_id - id вида животного
3. age - возраст животного
4. description - описание животного (повадки, ареал обитания и т д)    
Связи:  
ManyToOne c Species  
ManyToOne c Aviary   
ManyToMany c Review  
ManyToOne c Food  

Aviary  
Описывает вольер для животного. Содержит поля:
1. name - название вольера  
2. animal_id - id животного, живущего в вольере
3. size_id - id размера вольера
4. aviary_type_id - id типа вольера  
Связи:    
OneToMany c Animal   
ManyToOne c Aviary Type  
ManyToOne c Aviary Size   
  
Aviary Size    
Описывает размер вольера  
1. name - наименование размера вольера  
Связи:    
OneToMany c Aviary  

Aviary Type  
Описывает типы вольеров  
1. name - название типа вольера  
Связи:    
OneToMany c Aviary

Role  
Описывает роль пользователя в системе. Содержит поля:
1. name - название роли (гость, посетитель, работник, админ)  
Связи:    
OneToMany c User

User  
Описывает общую сущность пользователя. Содержит поля:
1. username - имя пользователя в системе
2. number - телефонный номер пользователя
3. email - адрес электронной почты пользователя
4. password - устанавливается пользователем при входе в систему
5. first_name - имя пользователя
6. last_name - фамилия пользователя
7. role - должность пользователя, определенная в таблице Role    
Связи:   
ManyToOne c Role    
OneToMany c Ticket  
OneToMany c Action  
OneToMany c Food Order  
OneToMany c Rewiew
OneToOne c Profile    
  
Rewiew  
Описывает отзыв, который можно оставить и просмотреть в системе. Содержит поля:  
1. user - пользователь, оставивший отзыв
2. text - текст отзыва
3. timestamp - время оставления отзыва  
Связи:    
ManyToMany c Animal  
ManyToOne c User  
  
Food Order  
Описывает заказ корма. Содержит поля:
1. food_name - наименование корма, который заказан
2. price - стоимость заказанного корма  
Связи:    
OneToMany c Food    
ManyToOne c User  
  
Food    
Описывает корм, который можно заказать. Содержит поля:  
1. animals - животные, которым подходит этот корм   
Связи:  
ManyToOne c FoodOrder      
ManyToOne c Animal
  
Ticket Type    
Описывает сущность типа билета в зоопарк. Содержит поля:
1. name - наименование типа билета    
Связи:    
OneToOne c Ticket   
  
Ticket  
Описывает сущность билета в зоопарк. Содержит поля:
1. user_id - id пользователя, заказавшего билет  
2. price - стоимость билета  
3. type_id - id типа билета   
Связи:    
ManyToOne c TicketType  
ManyToOne c User  
  
Action Type  
Описывает тип действия, происходящего в системе и регистрирующегося в журнал. Содержит поля:
1. name - наименование типа действия  
Связи:    
OneToMany c Action      
     
Action  
Описывает действия, происходящие в системе и регистрирующиеся в журнал. Содержит поля:
1. type_id - тип действия  
2. description - описание действия
3. user_id - id пользователя, совершившего действие
4. timestemp - время регистрации действия  
Связи:    
ManyToOne c ActionType   
ManyToOne c User
  

![image](https://github.com/Elizabeth379/DBLabs/assets/93152483/d412f266-fb9a-4993-84ea-a8a2d24c8a8f)
  
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
OneToOne c Aviary   
ManyToMany c Review  
ManyToOne c Food  

Aviary  
Описывает вольер для животного. Содержит поля:
1. name - название вольера  
2. animal_id - id животного, живущего в вольере
3. size_id - id размера вольера
4. aviary_type_id - id типа вольера  
Связи:    
OneToOne c Animal   
OneToOne c Aviary Type  
OneToOne c Aviary Size   
  
Aviary Size    
Описывает размер вольера  
1. name - наименование размера вольера  
Связи:    
OneToOne c Aviary  

Aviary Type  
Описывает типы вольеров  
1. name - название типа вольера  
Связи:    
OneToOne c Aviary

Role  
Описывает роль пользователя в системе. Содержит поля:
1. name - название роли (гость, посетитель, работник, админ)  
Связи:    
OneToOne c User

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
OneToOne c Role    
OneToMany c Ticket  
OneToOne c Action  
OneToMany c Food Order  
OneToMany c Rewiew  
  
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
OneToOne c TicketType  
ManyToOne c User  
  
Action Type  
Описывает тип действия, происходящего в системе и регистрирующегося в журнал. Содержит поля:
1. name - наименование типа действия  
Связи:    
OneToOne c Action      
     
Action  
Описывает действия, происходящие в системе и регистрирующиеся в журнал. Содержит поля:
1. type_id - тип действия  
2. description - описание действия
3. user_id - id пользователя, совершившего действие
4. timestemp - время регистрации действия  
Связи:    
OneToOne c ActionType   
ManyToOne c User  
ManyToOne c ActionLog   
  
Action Log    
Описывает журнал, регистрирующий действия в системе. Содержит поля:  
1. title - название журнала  
2. action_id - id действия из модели Action  
Связи:     
OneToMany c Action     

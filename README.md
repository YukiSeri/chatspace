# README

## Ruby version
  2.3.1

## Database creation
### messages

column|type|options  
------|----|-------
text|text|
image|text|
user_id|integer|null: false, foreign_key: true
group_id|integer|null: false, foreign_key: true
created_at|DATETIME|
updated_at|DATETIME|
#### association
* belongs_to :group
* belongs_to :user

### users
column|type|options  
------|----|-------
name|text|null: false
email|text|null: false
password|text|null: false
#### association
* has_many :messages
* has_many :groups, through: :messages


### groups
column|type|options  
------|----|-------
name|text|null: false
#### association
* has_many :users, through: :messages
* has_many :messages

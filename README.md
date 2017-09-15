# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version
  2.3.1
## System dependencies

## Configuration

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
name|varchar|null: false
email|varchar|null: false
password|varchar|null: false
#### association
* has_many :messages
* has_many :groups_tags
* has_many :groups, through: :groups_tags


### groups
column|type|options  
------|----|-------
name|text|null: false
#### association
* has_many :groups_tags
* has_many :users, through: :groups_tags
* has_many :messages

### groups_users
column|type|options  
------|----|-------
user_id|integer|null: false, foreign_key: true
group_id|integer|null: false, foreign_key: true
#### association
* belongs_to :user
* belongs_to :group

## Database initialization

## How to run the test suite

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

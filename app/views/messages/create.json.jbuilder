json.text @message.text
json.image_url @message.image.url(:thumb)
json.user_name @message.user.name
json.created_at @message.created_at.strftime('%Y/%m/%d %H:%M:%S')
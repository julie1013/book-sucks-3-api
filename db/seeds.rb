me=User.create(email:"satan@hell.org", password:"satan")

list1=List.create(user_id:me.id)

book1=Book.create(title:"50 Shades of Grey", author:"E.L. James")

read1=Read.create(list_id:list1.id, book_id:book1.id)

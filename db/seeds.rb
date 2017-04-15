me=User.create(email:"satan@hell.org", password:"satan", display_name: "Satan, Lord of darkness")

list1=List.create(user_id:me.id)

book1=Book.create(title:"50 Shades of Grey", author:"E.L. James")

book2=Book.create(title:"Mercy", author:"Jodi Picoult")

book3=Book.create(title:"Twilight", author:"Stephanie Meyer")

read1=Read.create(list_id:list1.id, book_id:book1.id)

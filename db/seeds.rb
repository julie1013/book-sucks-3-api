me=User.create(email:"satan@hell.org", password:"satan", display_name: "Satan, Lord of darkness")

list1=List.create(user_id:me.id)

book1=Book.create(title:"50 Shades of Grey",
                  author:"E.L. James",
                  synopsis: "Abusive piece of shit contracts a woman to be beaten")

book2=Book.create(title:"Mercy",
                  author:"Jodi Picoult",
                  synopsis: "In this overinflated 400-page book, 100 pages are
                  about the mercy killing advertised, but mostly it's about a
                  man fucking his mistress")

book3=Book.create(title:"Twilight", author:"Stephanie Meyer",
                  synopsis: "Another abusive piece of shit. But at least the
                  main character has a boyfriend. That's what's important."
)

read1=Read.create(list_id:list1.id, book_id:book1.id)

review1=Review.create(book_id: book1.id, user_id: me.id, body: "a sensual bdsm novel for the female masses?", rating: 5)

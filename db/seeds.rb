# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# delete associations
Book.all.each { |b| b.authors.clear }
Author.all.each { |a| a.books.clear }
BookLocation.delete_all
BorrowedBook.delete_all
# delete rows
Book.delete_all
Borrower.delete_all
LibraryBranch.delete_all
Publisher.delete_all
Author.delete_all
Address.delete_all

Address.create id: 1, address: 'La Paloma', city: 'Cebu', state: 'Cebu', zip: '6000'
Address.create id: 2, address: 'Naungan', city: 'Ormoc', state: 'Leyte', zip: '6001'
Address.create id: 3, address: 'Mansono', city: 'Lapu-lapu', state: 'Cebu', zip: '6002'

Author.create id: 1, first_name: 'Martina', last_name: 'Cole'
Author.create id: 2, first_name: 'John', middle_name: 'D.', last_name: 'MacDonald'
Author.create id: 3, first_name: 'Ronald', middle_name: 'James', last_name: 'Marsh'

Publisher.create id: 1, name: 'Grand Central Publishing', phone: '561-6192', address_id: 1
Publisher.create id: 2, name: 'The 5th Publisher', phone: '561-6193', address_id: 2
Publisher.create id: 3, name: 'Academia Publishing', phone: '561-6194', address_id: 3

Book.create id: 1, isbn: '0062110918', title: "The Diver's Clothes Lie Empty", publisher_id: 1, authors: [Author.find(1)]
Book.create id: 2, isbn: '1594633312', title: "Judy Blume", publisher_id: 2, authors: [Author.find(2), Author.find(3)]
Book.create id: 3, isbn: '0385539584', title: "The Knockoff", publisher_id: 2, authors: [Author.find(2)]

LibraryBranch.create id: 1, name: 'Stephen A. Schwarzman Building (Main Branch)', address_id: 2
LibraryBranch.create id: 2, name: 'Schomburg Center for Research in Black Culture', address_id: 3
LibraryBranch.create id: 3, name: 'Science, Industry and Business Library', address_id: 1

BookLocation.create id: 1, book_id: 1, library_branch_id: 1, num_copies: 34533
BookLocation.create id: 3, book_id: 2, library_branch_id: 2, num_copies: 956
BookLocation.create id: 2, book_id: 1, library_branch_id: 3, num_copies: 109356
BookLocation.create id: 4, book_id: 3, library_branch_id: 1, num_copies: 457
BookLocation.create id: 5, book_id: 3, library_branch_id: 2, num_copies: 1385

Borrower.create id: 1, card_no: 123, first_name: 'Stefany', middle_name: 'Marie', last_name: 'Serino', address_id: 2, phone: '243-4525'
Borrower.create id: 2, card_no: 456, first_name: 'Theodore', middle_name: 'Terry', last_name: 'Terdes', address_id: 1, phone: '561-4502'
Borrower.create id: 3, card_no: 789, first_name: 'Val', middle_name: 'Cool', last_name: 'Enriquez', address_id: 3, phone: '093284728374'

BorrowedBook.create id: 1, book_id: 1, library_branch_id: 3, borrower_id: 1, borrow_date: Time.now, due_date: 5.days.from_now, is_returned: false
BorrowedBook.create id: 2, book_id: 2, library_branch_id: 2, borrower_id: 2, borrow_date: Time.now - 10.days, due_date: 5.days.ago, is_returned: true
BorrowedBook.create id: 3, book_id: 3, library_branch_id: 1, borrower_id: 3, borrow_date: Time.now - 5.days, due_date: 1.day.from_now, is_returned: false

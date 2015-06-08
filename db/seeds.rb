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
# delete rows
Book.delete_all
LibraryBranch.delete_all
Publisher.delete_all
Author.delete_all
Address.delete_all

Address.create id: 1, address: 'La Paloma', city: 'Cebu', state: 'Cebu', zip: '6000'
Address.create id: 2, address: 'Naungan', city: 'Ormoc', state: 'Leyte', zip: '6001'
Address.create id: 3, address: 'Mansono', city: 'Lapu-lapu', state: 'Cebu', zip: '6002'

Author.create id: 1, first_name: 'Stefany', middle_name: 'Marie', last_name: 'Serino'
Author.create id: 2, first_name: 'Theodore', middle_name: 'Reek', last_name: 'Terdes'
Author.create id: 3, first_name: 'Val', middle_name: 'Maria', last_name: 'Enriquez'

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

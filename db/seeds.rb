# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
posts = Post.create do |p|
    p.title = 'testtitle1'
    p.company = 'testcompany1'
    p.source = 'testsource1.com'
    p.description = "<span class=\"tag-level-3\">C#</span>, SQL, Ruby, <span class=\"tag-level-1\">VB.NET</span>, <span class=\"tag-level--3\">ASP.NET</span>."
    p.url = 'http://localhost/'
    p.score = 1
end

keyword1 = Keyword.create do |k1|
    k1.word = "C#"
    k1.weight = 3
end
keyword2 = Keyword.create do |k2|
    k2.word = "VB.NET"
    k2.weight = 1
end
keyword3 = Keyword.create do |k3|
    k3.word = "ASP.NET"
    k3.weight = -3
end
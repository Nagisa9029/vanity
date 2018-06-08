crumb :root do
  link "Home", root_path
end

crumb :users do
  link 'Users', users_path
end
crumb :user do |user|
  link "@#{user.nickname}", user_path(user)
  parent :users
end
crumb :edit_user do |edit_user|
  link "編集@#{current_user.nickname}", edit_user_path(current_user)
  parent :users
end
crumb :following do |user|
  link "MyFollow", following_user_path(user)
  parent :users
end
crumb :followers do |user|
  link "MyFollowers", followers_user_path(user)
  parent :users
end

crumb :posts do
  link 'Community', posts_path
end
crumb :post do |post|
  link "ID@#{post.id}", post_path(post)
  parent :posts
end
crumb :postFollower do
  link "MyFollower", posts_follower_path
  parent :posts
end
crumb :postCommit do
  link 'MyCommit', posts_mycommit_path
  parent :posts
end
crumb :postRule do
  link "CommunityRule", posts_postrule_path
  parent :posts
end

crumb :gourmets do
  link 'Gourmet', gourmets_path
end
crumb :gourmet do |gourmet|
  link "ID@#{gourmet.id}", gourmet_path(gourmet)
  parent :gourmets
end
crumb :gourmetFollower do
  link "MyFollower", gourmets_follower_path
  parent :gourmets
end
crumb :gourmetCommit do
  link 'MyCommit', gourmets_mycommit_path
  parent :gourmets
end
crumb :gourmetRule do
  link "GourmetRule", gourmets_gourmetrule_path
  parent :gourmets
end

crumb :columns do
  link 'Column', columns_path
end
crumb :column do |column|
  link "ID@#{column.id}", column_path(column)
  parent :columns
end

crumb :commons do
  link 'Common', commons_path
end
crumb :common do |common|
  link "ID@#{common.id}", common_path(common)
  parent :commons
end

crumb :books do
  link 'Dictionary', books_path
end
crumb :book do |book|
  link "#{book.word}", book_path(book)
  parent :books
end
crumb :sepage do |sepage|
  link "Cepage", books_sepage_path
  parent :books
end

crumb :contacts do
  link 'Contact', contacts_path
end
crumb :contact do |contact|
  link "ID@#{contact.id}", contact_path(contact)
  parent :contacts
end

crumb :studys do
  link 'MENU', studys_path
end

crumb :about do
  link 'About', about_root_path
end
crumb :Terms_of_Use do
  link "Terms_of_Use", terms_of_use_root_path
end
crumb :Privacy do
  link "Privacy", privacy_root_path
end
crumb :Log_in do
  link "Log_in", new_session_path(resource_name)
end
crumb :Sign_up do
  link "Sign_up", new_registration_path(resource_name)
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
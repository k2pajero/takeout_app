crumb :root do
  link "Home", root_path
end

crumb :items do
  link "商品詳細", item_path
  parent :root
end

crumb :baskets do
  link "買い物かご", basket_path
  parent :root
end

crumb :users do
  link "会員情報＆編集", users_path
  parent :root
end

crumb :users do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :listing do
  link "出品", new_item_path
  parent :root
end

crumb :item_edit do
  link "編集", edit_item_path
  parent :items
end

crumb :search do
  link "検索結果", search_items_path
  parent :root
end

crumb :second_search do
  link "詳細検索結果", second_search_items_path
  parent :search
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
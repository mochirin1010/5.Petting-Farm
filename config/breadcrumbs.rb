crumb :root do
  link "トップページ", root_path
end

crumb :home_about do
  link "アプリ紹介", about_path
end

crumb :posts_index do
  link "投稿一覧", posts_path
end

crumb :pets_index do
  link "ペット一覧", pets_path
end

crumb :user_show do
  @user = User.find(params[:id])
  link "#{@user.username}さん", user_path(@user)
end
crumb :myuser_show do
  @user = User.find_by(id: current_user.id)
  link "#{@user.username}さん", user_path(@user)
end

crumb :post_parent_category do |post|
  post = Post.find(params[:id])
  link "記事詳細", post_path(post)
  parent :posts_index
end
crumb :mypost_parent_category do |post|
  post = Post.find(params[:id])
  link "My記事詳細", post_path(post)
  parent :myuser_show
end

crumb :pet_parent_category do |pet|
  pet = Pet.find(params[:id])
  link "#{pet.name}", pet_path(pet)
  parent :pets_index
end
crumb :mypet_parent_category do |pet|
  pet = Pet.find(params[:id])
  link "#{pet.name}", pet_path(pet)
  parent :myuser_show
end

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
ActiveAdmin.register New do
  permit_params :name, :description, :enable

  menu priority: 3, label: "最新消息"

  index title: "最新消息" do
    selectable_column
    column "最新消息", :name
    column "最新消息詳細資訊", :description
    column "顯示?", :enable

    actions defaults: false do |news|
      links = ''.html_safe
      links += link_to "檢視", admin_news_path(news), class: "member_link view_link"
      links += link_to "編輯", edit_admin_news_path(news), class: "member_link edit_link"
      links += link_to "刪除", admin_news_path(news), :method => :delete, :confirm => "確定嗎?", class: "member_link delete_link"
      links
    end
  end

  filter :name, label: '最新消息'
  filter :description, label: '最新消息詳細資訊'
  filter :enable, label: '顯示?'

  form title: "最新消息" do |f|
    f.inputs "最新消息" do
      f.input :name, label: '最新消息'
      f.input :description, label: '最新消息詳細資訊'
      f.input :enable, label: '顯示?'
    end
    f.actions
  end

  show title: "最新消息" do
    panel "最新消息" do
      table_for new do
        column '消息名稱' do
          new.name
        end
        column '消息內容' do
          new.description
        end
        column '顯示？' do
          new.enable
        end
      end
    end
  end
end

Erp::Saoee::Engine.routes.draw do
  scope "(:locale)", locale: /en|jp|vi/ do
    root to: "frontend/home#index"
    
    get "dich-vu.html" => "frontend/about_us#index", as: :about_us
    
    get "san-pham.html" => "frontend/service#index", as: :service
    get "san-pham/:title-ctgsvr:cat_id.html" => "frontend/service#detail", as: :service_detail
    
    get "du-an.html" => "frontend/project#index", as: :project
    get "du-an/:title-pj:project_id.html" => "frontend/project#detail", as: :project_detail
    
    get "tin-tuc.html" => "frontend/blog#index", as: :blog
    get "tin-tuc/:title-bl:blog_id.html" => "frontend/blog#detail", as: :blog_detail
    get "tin-tuc/chu-de/:title-ctgbl:cat_id.html" => "frontend/blog#index", as: :blog_with_category
    
    get "lien-he.html" => "frontend/contact_us#index", as: :contact_us
    post "lien-he.html" => "frontend/contact_us#index"
    
    get "tuyen-dung.html" => "frontend/recruitment#index", as: :recruitment
    get "tuyen-dung/:title-rcm:recruitment_id.html" => "frontend/recruitment#detail", as: :recruitment_detail
  end
end
Erp::Saoee::Engine.routes.draw do
  scope "(:locale)", locale: /en|ja|vi/ do
    root to: "frontend/home#index"

    get "story" => "frontend/about_us#index", as: :about_us

    get "san-pham" => "frontend/product#index", as: :product
    get "san-pham/:title-prd:product_id" => "frontend/product#detail", as: :product_detail

    get "dich-vu" => "frontend/service#index", as: :service
    get "dich-vu/:title-srv:service_id" => "frontend/service#detail", as: :service_detail

    get "du-an" => "frontend/project#index", as: :project
    get "du-an/:title-pj:project_id" => "frontend/project#detail", as: :project_detail

    get "tin-tuc" => "frontend/blog#index", as: :blog
    get "tin-tuc/:title-bl:blog_id" => "frontend/blog#detail", as: :blog_detail
    get "tin-tuc/chu-de/:title-ctgbl:cat_id" => "frontend/blog#index", as: :blog_with_category

    get "lien-he" => "frontend/contact_us#index", as: :contact_us
    post "lien-he" => "frontend/contact_us#index"

    get "tuyen-dung" => "frontend/recruitment#index", as: :recruitment
    get "tuyen-dung/:title-rcm:recruitment_id" => "frontend/recruitment#detail", as: :recruitment_detail
  end
end
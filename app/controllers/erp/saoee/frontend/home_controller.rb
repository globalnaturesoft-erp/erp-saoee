module Erp
  module Saoee
    module Frontend
      class HomeController < Erp::Frontend::FrontendController
        def index
          @sliders = Erp::Banners::Banner.get_home_sliders.order('erp_banners_banners.custom_order asc')
          @newest_blogs = Erp::Articles::Article.newest_articles(3, I18n.locale.to_s)
          #@testimonials = Erp::Testimonials::Testimonial.get_testimonials
          @product_menus = Erp::Articles::Category.get_categories_by_alias_product
                    .where(parent_id: nil)
                    .order('erp_articles_categories.custom_order ASC')
          @products = Erp::Articles::Article.where(category_id: @product_menus.pluck(:id))
        end
      end
    end
  end
end
module Erp
  module Saoee
    module Frontend
      class BlogController < Erp::Frontend::FrontendController
        def index
          @blogs = Erp::Articles::Article.get_all_blogs(params, I18n.locale.to_s)
                                        .paginate(:page => params[:page], :per_page => 15)
          @categories = Erp::Articles::Category.get_categories_by_alias_blog
          @newest_blogs = Erp::Articles::Article.newest_articles(5, I18n.locale.to_s)
          if params[:cat_id].present?
            @category = Erp::Articles::Category.find(params[:cat_id])
          end
        end

        def detail
          @blog = Erp::Articles::Article.find(params[:blog_id])
          #@blog.increase_visit # cap nhat luot xem
          @blog = @blog
          @meta_keywords = @blog.meta_keywords
          @meta_description = @blog.meta_description
          @categories = Erp::Articles::Category.get_categories_by_alias_blog
          @newest_blogs = Erp::Articles::Article.where.not(id: @blog.id).newest_articles(3, I18n.locale.to_s)
          # @related_blogs = Erp::Articles::Article.related_articles
        end
      end
    end
  end
end
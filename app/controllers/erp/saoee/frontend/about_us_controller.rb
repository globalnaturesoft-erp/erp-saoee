module Erp
  module Saoee
    module Frontend
      class AboutUsController < Erp::Frontend::FrontendController
        def index
          #@about = Erp::Articles::Article.get_all_abouts.find(params[:about_id])
          @about = Erp::Articles::Article.get_all_home_abouts.first
          #@leaders = Erp::Corporators::Corporator.all_active.get_leadership_corporators.order('erp_corporators_corporators.custom_order asc')
          #@company_structure = Erp::Articles::Article.get_all_company_structure.last
          @meta_keywords = @about.meta_keywords
          @meta_description = @about.meta_description
        end
      end
    end
  end
end
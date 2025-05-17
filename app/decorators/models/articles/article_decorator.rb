Erp::Articles::Article.class_eval do

  mount_uploader :en_image, Erp::Articles::ArticleUploader
  mount_uploader :ja_image, Erp::Articles::ArticleUploader

  # Count article views
  def increase_visit(by = 1)
    self.views ||= 0
    self.views += by
    self.save
  end

  # get all blogs
  def self.get_services(params={})
    query = self.get_active

    if params[:cat_id].present?
      query = query.where(category_id: params[:cat_id])
    else
      query = query.joins(:category).where('erp_articles_categories.alias = ?', Erp::Articles::Category::ALIAS_SERVICE)
    end

    query = query.order('erp_articles_articles.custom_order ASC')
  end

  # get all blogs
  def self.get_recruitments(params={})
    query = self.get_active

    if params[:cat_id].present?
      query = query.where(category_id: params[:cat_id])
    else
      query = query.joins(:category).where('erp_articles_categories.alias = ?', Erp::Articles::Category::ALIAS_CAREER)
    end

    query = query.order('erp_articles_articles.created_at DESC')
  end

  # get all home about us
  def self.get_all_home_abouts
    query = self.get_active
    query = query.joins(:category).where('erp_articles_categories.alias = ?', Erp::Articles::Category::ALIAS_HOME_ABOUT)
    query = query.order('erp_articles_articles.custom_order ASC')
  end

  # get all about us
  def self.get_all_abouts
    query = self.get_active
    query = query.joins(:category).where('erp_articles_categories.alias = ?', Erp::Articles::Category::ALIAS_ABOUT_US)
    query = query.order('erp_articles_articles.custom_order ASC')
  end

  ## get articles by category
  #def self.get_articles_by_category(params={})
  #  query = self.get_active
  #  if params[:cat_id].present?
  #    query = query.where(category_id: params[:cat_id])
  #  end
  #end

  # get all blogs
  def self.get_all_blogs(params, language = nil)
    query = self.get_active.order('erp_articles_articles.created_at DESC')

    # filter by language
    if language.present?
      case language.to_sym
      when :vi
        query = query.where.not(erp_articles_articles: { name: ["", nil] })
      when :en
        query = query.where.not(erp_articles_articles: { en_name: ["", nil] })
      when :ja
        query = query.where.not(erp_articles_articles: { ja_name: ["", nil] })
      end
    end

    if params[:cat_id].present?
      query = query.where(category_id: params[:cat_id])
    else
      query = query.joins(:category).where('erp_articles_categories.alias = ?', Erp::Articles::Category::ALIAS_BLOG)
    end
    query
  end

  # get newest articles
  def self.newest_articles(limit=nil, language = nil)
    query = self.get_all_blogs({}, language)

    query = query.limit(limit || 3)
  end
end
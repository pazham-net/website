class Article < ApplicationRecord
  before_save :set_slug

  def title
    send("title_#{I18n.locale}")
  end

  def content
    send("content_#{I18n.locale}")
  end

  def medias
    (attributes["medias"] || "").split(",").map { |media| "/medias/#{media}" }
  end

  def slug
    # send("slug_#{I18n.locale}")
    send("slug_en")
  end

  def to_param
    slug
  end

  private

    def set_slug
      return if slug.present?

      [:en, :ml, :manglish].each do |locale|
        itr = 1
        loop do
          title_slug = send("title_#{locale}").parameterize
          slug_candidate = itr > 1 ? "#{title_slug}-#{itr}" : title_slug
          break self.send("slug_#{locale}=", slug_candidate) unless Article.exists?("slug_#{locale}": slug_candidate)
          itr += 1
        end
      end
    end
end

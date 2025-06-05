class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :author, :category, :published_at

  def published_at
    object.published_at.to_s
  end
end

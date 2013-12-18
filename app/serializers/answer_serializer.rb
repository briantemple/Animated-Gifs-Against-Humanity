class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :text, :url, :pictureId
end

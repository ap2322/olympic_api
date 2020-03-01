class OlympianSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name,
             :sex,
             :age,
             :height,
             :weight
  belongs_to :sport

end

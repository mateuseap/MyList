class Tarefa < ApplicationRecord
  belongs_to :usuario

  def finalizada?
    !finalizada.blank?
  end
end

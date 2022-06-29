# frozen_string_literal: true

# Усложенное задание (выполнять только если есть время и желание разобраться):
# Создать модуль InstanceCounter, содержащий следующие методы класса и инстанс-методы,
# которые подключаются автоматически при вызове include в классе:
# Методы класса:
#  - instances, который возвращает кол-во экземпляров данного класса
# Инастанс-методы:
#  - register_instance, который увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора.
# При этом данный метод не должен быть публичным.
# perpend

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances
  end

  module InstanceMethods
    private

    def register_instance
      self.class.instances = 0 if self.class.instances.nil?
      self.class.instances += 1
    end
  end
end


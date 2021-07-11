require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'Nome é Obrigratório' do
    user = User.new(name: nil)
    user.save
    assert user.errors[:name].any?
  end

  test 'Email é obrigatório e no formátio válido' do
    user = User.new(email: nil)
    user.save
    
    assert user.errors[:email].any?

    user = User.new(email: 'inválido')
    user.save
    
    assert user.errors[:email].any?

    user = User.new(email: 'valido@exemplo.com')
    user.save
    
    refute user.errors[:email].any?
  end

  test 'Email é único' do
    user = User.create!(name: 'Darth Vader', email: 'varder@imperio.com', password:'secret', password_confirmation: 'secret')
    other_user = User.create!(email: 'varder@imperio.com')

    assert other_user.errors[:email].any?
  end
end

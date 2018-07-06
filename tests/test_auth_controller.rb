require './helpers/spec_helper.rb'

describe 'Micro Learning Application' do
  before do
    @test_user = {
      'username' => 'admin',
      'email' => 'admin@mail.com',
      'password' => '123456789'
    }
  end
  context 'When user add correct data' do
    before { post '/register', @test_user }
    it 'should login and redirect successfully' do
      expect(last_response).to be_redirect
    end
  end
  it 'should allow accessing the landing page' do
    get '/'
    expect(last_response).to be_ok
  end
end

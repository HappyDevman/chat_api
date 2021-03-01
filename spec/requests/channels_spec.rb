require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/channels', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Channel. As you add validations to Channel, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: 'channel' }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  let(:user) { User.create(email: 'test@test.com', password: 'password') }

  describe 'GET /index' do
    before { sign_in(user, scope: :user) }

    it 'renders a successful response' do
      Channel.create! valid_attributes.merge({ owner: user })
      get channels_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    before { sign_in(user, scope: :user) }

    it 'renders a successful response' do
      channel = Channel.create! valid_attributes.merge({ owner: user })
      get channel_url(channel), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    before { sign_in(user, scope: :user) }

    context 'with valid parameters' do
      it 'creates a new Channel' do
        expect do
          post channels_url,
               params: { channel: valid_attributes }, as: :json
        end.to change(Channel, :count).by(1)
      end

      it 'renders a JSON response with the new channel' do
        post channels_url,
             params: { channel: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Channel' do
        expect do
          post channels_url,
               params: { channel: invalid_attributes }, as: :json
        end.to change(Channel, :count).by(0)
      end

      it 'renders a JSON response with errors for the new channel' do
        post channels_url,
             params: { channel: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    before { sign_in(user, scope: :user) }

    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'new channel' }
      end

      it 'updates the requested channel' do
        channel = Channel.create! valid_attributes.merge({ owner: user })
        expect do
          patch channel_url(channel),
                params: { channel: new_attributes }, as: :json
        end.to change { channel.reload.name }.to('new channel')
      end

      it 'renders a JSON response with the channel' do
        channel = Channel.create! valid_attributes.merge({ owner: user })
        patch channel_url(channel),
              params: { channel: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the channel' do
        channel = Channel.create! valid_attributes.merge({ owner: user })
        patch channel_url(channel),
              params: { channel: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    before { sign_in(user, scope: :user) }

    it 'destroys the requested channel' do
      channel = Channel.create! valid_attributes.merge({ owner: user })
      expect do
        delete channel_url(channel), as: :json
      end.to change(Channel, :count).by(-1)
    end
  end
end
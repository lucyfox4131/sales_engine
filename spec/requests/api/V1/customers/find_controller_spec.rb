require 'rails_helper'

describe "Customers Find Controller" do
  it "can find a customer based on id" do
    customer = create(:customer)
    get '/api/v1/customers/find', params: {id: customer.id}

    expect(response).to be_success
    expect(json["id"]).to eq(customer.id)
  end

  it "can find a customer based on name" do
    customer = create(:customer, name: "MerchantName")
    get '/api/v1/customers/find', params: {name: "MerchantName"}

    expect(response).to be_success
    expect(json["name"]).to eq("MerchantName")
  end

  it "can find a customer based on created_at" do
    time = "2012-03-27 14:53:59 UTC"
    customer = create(:customer, created_at: time)
    get '/api/v1/customers/find', params: {created_at: time}

    expect(response).to be_success
    expect(json["created_at"]).to eq("2012-03-27T14:53:59.000Z")
  end

  it "can find a customer based on updated_at" do
    time = '2012-06-30 14:53:59 UTC'
    customer = create(:customer, updated_at: time)
    get '/api/v1/customers/find', params: {updated_at: time}

    expect(response).to be_success
    expect(json["updated_at"]).to eq("2012-06-30T14:53:59.000Z")
  end
end

require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @square_input = params.fetch("user_square").to_f
  @square = @square_input**2
  
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @input = params.fetch("user_sqrt").to_f
  @square_root = @input**0.5
  
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f / 100 / 12
  @duration = params.fetch("user_duration").to_i
  @principal =  params.fetch("user_principal").to_f

  @apr_display = (@apr*100*12).to_fs(:percentage, {:precision => 4})
  @principal_display = @principal.to_fs(:currency)

  @periods = @duration * 12

  @payment = (@apr * @principal) / (1 - (1 + @apr)**(-@periods))
  @payment_display = @payment.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @rand_num = rand(@min..@max)

  erb(:random_results)
end

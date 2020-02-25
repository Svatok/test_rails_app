module HelloWorld::Operation
  class Show < Trailblazer::Operation
    step :model

    def model(ctx, params:, **)
      ctx[:model] = HelloWorld.find_by(name: params[:name])
    end
  end
end

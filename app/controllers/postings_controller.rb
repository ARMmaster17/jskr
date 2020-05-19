class PostingsController < ApplicationController
    def next
        render json: Post.order(:score).first
    end
end

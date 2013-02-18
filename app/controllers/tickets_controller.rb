# coding: utf-8

class TicketsController < ApplicationController
    def index
        @tickets = Ticket.all(:order => "created_at DESC")
    end

    def show
        @ticket = Ticket.find(params[:id])
    end

    def new
        @ticket = Ticket.new
    end

    def create
        @ticket = Ticket.new(params[:ticket])
        if @ticket.save
            redirect_to tickets_path, notice: '新しいチケットが作成されました！'
        else
            render action: 'new'
        end
    end

    def edit
        @ticket = Ticket.find(params[:id])
    end

    def update
        @ticket = Ticket.find(params[:id])
        if @ticket.update_attributes(params[:ticket])
            redirect_to tickets_path, notice: '更新されました！'
        end
    end
end

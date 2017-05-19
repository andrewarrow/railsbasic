class BlogController < ApplicationController

  def index
    @title = 'The Blog'
  end

  def show
    y = params[:year].to_s
    m = params[:month]
    s = params[:slug]
    
    b = BlogController.data[y][m][s]

    unless b
      render text: 'not found', status: 404
      return
    end

    @title = b[:title]
    @author = b[:author]
    @month = m
    @year = y
    render b[:file]
  end

  def self.data
    w = {title: "Why I started this site", author: "Andrew Arrow", file: 'why'}
    w2 = {title: "What Other Stuff", author: "Tom Smith", file: 'stuff'}
    h = {}
    h['2017'] = {}
    h['2017']['may'] = {}
    h['2017']['may']['why-i-started-this-site'] = w
    h['2017']['may']['what-other-stuff'] = w2
    h
  end

end

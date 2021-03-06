require 'rubygems'
require 'bundler/setup'
require 'json'

Bundler.require(:default)

require './lib/steps'
require './lib/steps/get_template'
require './lib/steps/get_url'
require './lib/steps/signin'
require './lib/steps/get_group'
require './lib/steps/set_template'


prompt = TTY::Prompt.new
agent = Mechanize.new

markdown = Steps::GetTemplate.new(prompt).call
url = Steps::GetUrl.new(prompt).call
page = Steps::Signin.new(prompt, agent, url).call
path = Steps::GetGroup.new(prompt, agent, url).call
dunno = Steps::SetTemplate.new(agent, url, path, markdown).call

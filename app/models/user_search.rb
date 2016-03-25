# encoding: utf-8
class UserSearch
  include SearchObject.module(:model, :sorting, :will_paginate)
  scope { User.all }
  
#   per_page 30
  
  sort_by :name, :family_name
  
  option :person_id 
  
  option :name do |scope, value|
    scope.where 'name LIKE ?', escape_search_term(value) if is_not_nil_empty?(value)
  end
  
  option :family_name do |scope, value|
    scope.where 'family_name LIKE ?', escape_search_term(value) if is_not_nil_empty?(value)
  end
  
  def sort_params_arr
    [
      ["#{I18n.t(:name)} #{I18n.t('a-z')}", 'name asc'],  
      ["#{I18n.t(:name)} #{I18n.t('z-a')}", 'name desc'],
      ["#{I18n.t('activerecord.attributes.user.family_name')} #{I18n.t('a-z')}", 'family_name asc'],
      ["#{I18n.t('activerecord.attributes.user.family_name')} #{I18n.t('z-a')}", 'family_name desc']     
    ]     
  end 
  
  
#   def initialize(filters = {}, page = 1, atributes = {})
#     @atributes = atributes
#     filters = Hash.new if filters.nil?
#     filters['sort'] = 'name asc' unless filters.has_key?('sort') 
    
    
#     super filters
#   end  
  
  private
  
  def is_not_nil_empty?(value)
    !value.nil? && !value.empty? && value.strip.length > 0
  end
  
  def escape_search_term(term)
    "%#{term.gsub(/\s+/, '%')}%"
  end
end
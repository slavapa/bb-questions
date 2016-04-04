# encoding: utf-8
class QuestionSearch
  include SearchObject.module(:model, :sorting, :will_paginate)
  scope { Question.all }
  
  sort_by 'id', 'name', 'from', 'ip', 'approved', 'banned'
  
  option :approved 
  option :banned 
 
  option :name do |scope, value|
    scope.where 'name LIKE ?', escape_search_term(value) if is_not_nil_empty?(value)
  end
  
  option :from do |scope, value|
    scope.where 'from LIKE ?', escape_search_term(value) if is_not_nil_empty?(value)
  end
  
  option :ip do |scope, value|
    scope.where 'ip LIKE ?', escape_search_term(value) if is_not_nil_empty?(value)
  end
   
  option :question do |scope, value|
    if is_not_nil_empty?(value) 
      val = escape_search_term(value)
      scope.where 'question LIKE ? OR translation LIKE ?', val, val
    end
  end
  
  def sort_params_arr
    [
      ["#{I18n.t(:id)} #{I18n.t('a-z')}", 'id asc'],  
      ["#{I18n.t(:id)} #{I18n.t('z-a')}", 'id desc'], 
      ["#{I18n.t(:name)} #{I18n.t('a-z')}", 'name asc'],  
      ["#{I18n.t(:name)} #{I18n.t('z-a')}", 'name desc'], 
      ["#{I18n.t('activerecord.attributes.question.from')} #{I18n.t('a-z')}", 'from asc'],  
      ["#{I18n.t('activerecord.attributes.question.from')} #{I18n.t('z-a')}", 'from desc'], 
      ["#{I18n.t('activerecord.attributes.question.ip')} #{I18n.t('a-z')}", 'ip asc'],  
      ["#{I18n.t('activerecord.attributes.question.ip')} #{I18n.t('z-a')}", 'ip desc'], 
      ["#{I18n.t('activerecord.attributes.question.approved')} #{I18n.t('a-z')}", 'approved asc'],  
      ["#{I18n.t('activerecord.attributes.question.approved')} #{I18n.t('z-a')}", 'approved desc'] , 
      ["#{I18n.t('activerecord.attributes.question.banned') } #{I18n.t('a-z')}", 'banned asc'],  
      ["#{I18n.t('activerecord.attributes.question.banned') } #{I18n.t('z-a')}", 'banned desc']              
    ]     
  end 
  
  option :sort_1 do |scope, value|
    scope.order value
  end
  
  option :sort_2 do |scope, value|
     scope.order value
  end
  
  option :sort_3 do |scope, value|
     scope.order value
  end
 
  
  private
  
  def is_not_nil_empty?(value)
    !value.nil? && !value.empty? && value.strip.length > 0
  end
  
  def escape_search_term(term)
    "%#{term.gsub(/\s+/, '%')}%"
  end
end
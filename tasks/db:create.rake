namespace 'db' do
  task 'after_create' do
    ActiveRecord::Base.connection.execute('CREATE extension postgis')
  end
end

Rake::Task['db:create'].enhance do
  Rake::Task['db:after_create'].invoke
end
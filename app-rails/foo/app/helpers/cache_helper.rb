module CacheHelper

  # 记录当前实体相关的页面，方便实体更新时，刷新页面缓存
  def c(object)
    mark_cache_instance(object)
    object
  end

  # 记录当前实体相关的页面，方便实体更新时，刷新页面缓存
  # @params
  # 1. object 直接传递实体对象
  # 2. name, id 或者传递实体表名及id
  def mark_cache_instance(*array)
    name, id = array
    object   = array.first
    if id
      name = name.downcase
    else
      name = object.class.table_name.downcase
      id   = object.id
    end
    $redis.sadd("i:#{name}:#{id}", request.url)
  end

end

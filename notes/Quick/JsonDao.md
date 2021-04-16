# JsonDao

## listCarBrands

搜索品牌集合的名称或者拼音

### 参数列表

参数名 | 说明 |
---|---|
nameOrPy |  |
context |  |

## findVehicleRankByBrand

找出品牌下所有的车系

### 参数列表

参数名 | 说明 |
---|---|
brandId | 品牌 id |
context |  |

## findVehicleTypeByRank

找出车系下所有的车型

### 参数列表

参数名 | 说明 |
---|---|
rankId | 车系 id |
context |  |

## findVehicleTypeByCodeOrName

根据编码或者名称超查找车型

### 参数列表

参数名 | 说明 |
---|---|
codeOrName |  |
context |  |

## findPartList

查找部位列表

### 参数列表

参数名 | 说明 |
---|---|

## openVehicleTypeDb

通知 Android 打开当前车型数据库
 打开数据库后，才能查询车型和配件信息
 找不到数据库时，将会调用错误回调

### 参数列表

参数名 | 说明 |
---|---|
brandCode | 品牌编码 |
rankId | 车系 id |
vehicleType | 车型 json |
context |  |

## findVehiclePart

查找车型配件

### 参数列表

参数名 | 说明 |
---|---|
rankId | 车系 id |
typeId | 车型 id |
partName | 配件名称 |

## findPartLocalPrice

查询配件本地价格

### 参数列表

参数名 | 说明 |
---|---|
array | 配件编码列表 |
context |  |

### 返回


```
{"id":{price}
 ,....}
```

## findSmallHourPrice



### 参数列表

参数名 | 说明 |
---|---|
repairGroupId | 修理类型 |
gradeId | 车系等级 |
gongCompSet | 工时价格类型 |
factoryJson | 修理厂实体 |
vehicleTypeJson | 车型实体 |
brandCode |  |
repairPlant | 修理厂类型	管控开关 |
repairBrand | 承修品牌与定损品牌是否一致	管控开关 |
repairPlantType | 管控开关 |
context |  |

## findAssistLocalFee



### 参数列表

参数名 | 说明 |
---|---|
gradeId | 车系等级 |
factoryJson | 修理厂实体 |
context |  |


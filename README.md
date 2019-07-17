# PerlEtc

## 構成図

  +----------+               +-------------+
  |          | (JSON data)   |             |
  | Server A +-------------->| Vendor Stub +-------> /directory
  |          |               |             |          |
  +----------+               +-------------+          +- /yyyymmdd_transaction.db
                                                         
### JSON data

- key: sequence
- value: object

#### sequence 発行

- 案1: 行数 = sequence という考え

{"key1":"value1", "key2":"value2" ... "keyn":[{"list1":"list_value1", ..."list5":"list_value5"}]}
{"key1":"value1", "key2":"value2" ... "keyn":[{"list1":"list_value1", ..."list5":"list_value5"}]}
{"key1":"value1", "key2":"value2" ... "keyn":[{"list1":"list_value1", ..."list5":"list_value5"}]}
{"key1":"value1", "key2":"value2" ... "keyn":[{"list1":"list_value1", ..."list5":"list_value5"}]}
 :
(最大 999,999 まで増える)

#### 例外系


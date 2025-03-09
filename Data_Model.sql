-- Refer this Site and Paste the below Tables Info
-- https://app.quickdatabasediagrams.com/#/

-- For Data Modelling,
-- Three Levels:
-- Conceptual, Logical and Physical Data Model
-- Here Implelented till Conceptual anf Logical

Transactions
-
order_id PK long
line_id int
type string
dt timestamp
pos_site_id string FK >- Site.site_id
sku_id string FK >- Product.sku_id
fscldt_id int FK >- Calendar.fscldt_id
price_substate_id string FK >- price_state.substate_id
sales_units int
sales_dollars double
discount_dollars double
original_order_id long
original_line_id int

Average_Costs
-
fscldt_id PK int FK >- Calendar.fscldt_id
sku_id PK string FK >- Product.sku_id
average_unit_standardcost double
average_unit_landedcost double

Calendar
-
fscldt_id PK int
fscldt_label string
fsclwk_id int
fsclwk_label string
fsclmth_id int
fsclmth_label string
fsclqrtr_id int
fsclqrtr_label string
fsclyr_id int
fsclyr_label int
ssn_id string
ssn_label string
ly_fscldt_id int 
lly_fscldt_id int
fscldow int
fscldom int
fscldoq int
fscldoy int
fsclwoy int
fsclmoy int
fsclqoy int
date date

Holiday
-
hldy_id PK string
hldy_label string

Invoice_Loc
-
loc PK int
loc_label string
loctype string
loctype_label string

Invoice_Status
-
code_id PK string
code_label string
bckt_id string
bckt_label string
ownrshp_id string
ownrshp_label string

Site
-
site_id PK string
site_label string
subchnl_id string
subchnl_label string
chnl_id string
chnl_label string

price_state
-
substate_id PK string
substate_label string
state_id string
state_label string

Product
-
sku_id PK string
sku_label string
stylclr_id string
stylclr_label string
styl_id string
styl_label string
subcat_id int
subcat_label string
cat_id int
cat_label string
dept_id int
dept_label string
issvc int
isasmbly int
isnfs int

R_Loc
-
str PK int
str_label string
dstr int
dstr_label string
rgn int
rgn_label string

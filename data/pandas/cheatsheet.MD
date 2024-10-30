# Pandas 

### Make Data Frame

```
import pandas as pd
df = pd.read_csv('bestsellers.csv')

```


### Read Data Frame

* Get the first 5 rows of the spreadsheet

```
df.head()
```

# works on individual columns, and can provide number of rows
print(df["Rating"].head(10))


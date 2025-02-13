# %%
"""
This script will aggregate postcode level gas consumption data and IMD data.
It will use the polars library to ingest and process the data.

"""

# %%

import polars as pl

# %%
# ingest the data from the open data portal

csv_path = r"""https://opendata.westofengland-ca.gov.uk/api/explore/v2.1/catalog/datasets/gas_postcode_lep/exports/csv?lang=en&timezone=Europe%2FLondon&use_labels=true&delimiter=%2C"""

raw_data = pl.read_csv(csv_path)

# %%
clean_data = raw_data.rename(lambda x: x.replace(" ", "_").lower())


# %%
type(clean_data)
# %%
# normalise the consumption data

aggregated_data = clean_data.group_by("lower_super_output_area_code").agg(
    [
        pl.sum("total_consumption").alias("total_consumption_lsoa"),
        pl.min("indices_of_multiple_deprivation").alias("imd_min_rank_lsoa"),
    ]
)
# %%
aggregated_data.glimpse()

# %%
# build a linear model of gas consumption based on IMD rank

aggregated_data = aggregated_data.drop_nulls()

# %%


# %%


# %%


# %%


# %%


# %%


# %%

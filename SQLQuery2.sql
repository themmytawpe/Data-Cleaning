 select		*
from		PortfolioProject.dbo.NashvilleHousing

select	SaleDateConverted, CONVERT(date,saledate)
from	PortfolioProject.dbo.NashvilleHousing

update	PortfolioProject.dbo.NashvilleHousing
set		SaleDate = CONVERT(date,saledate)

alter table		PortfolioProject.dbo.NashvilleHousing
add				SaleDateConverted Date;

update	PortfolioProject.dbo.NashvilleHousing
set		SaleDateConverted = CONVERT(date,saledate)

select	*
from	PortfolioProject.dbo.NashvilleHousing
order by	ParcelID


select	a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress
from	PortfolioProject.dbo.NashvilleHousing a
join	PortfolioProject.dbo.NashvilleHousing b
	on	a.ParcelID = b.ParcelID
	and	a.[UniqueID ] <> b.[UniqueID ]

select	PropertyAddress
from	PortfolioProject.dbo.NashvilleHousing

select	SUBSTRING(propertyaddress, -1, CHARINDEX(',', PropertyAddress)) as Address
,		SUBSTRING(propertyaddress, CHARINDEX(',', PropertyAddress) +1, LEN(propertyaddress)) as Address
from	PortfolioProject.dbo.NashvilleHousing 

alter table		PortfolioProject.dbo.NashvilleHousing
add				PropertySplitAddress nvarchar(255);


update	PortfolioProject.dbo.NashvilleHousing
set		PropertySplitAddress = SUBSTRING(propertyaddress, -1, CHARINDEX(',', PropertyAddress))

alter table		PortfolioProject.dbo.NashvilleHousing
add				PropertySplitCity nvarchar(255);


update	PortfolioProject.dbo.NashvilleHousing
set		PropertySplitCity = SUBSTRING(propertyaddress, CHARINDEX(',', PropertyAddress) +1, LEN(propertyaddress))

select	PARSENAME(replace(OwnerAddress, ',', '.'), 3) 
		,PARSENAME(replace(OwnerAddress, ',', '.'), 2)
		,PARSENAME(replace(OwnerAddress, ',', '.'), 1)
from	PortfolioProject.dbo.NashvilleHousing

alter table		PortfolioProject.dbo.NashvilleHousing
add				OwnerSplitAddress nvarchar(255);

update	PortfolioProject.dbo.NashvilleHousing
set		OwnerSplitAddress = PARSENAME(replace(OwnerAddress, ',', '.'), 3)

alter table		PortfolioProject.dbo.NashvilleHousing
add				OwnerSplitCity nvarchar(255);

update	PortfolioProject.dbo.NashvilleHousing
set		OwnerSplitCity = PARSENAME(replace(OwnerAddress, ',', '.'), 2)

alter table		PortfolioProject.dbo.NashvilleHousing
add				OwnerSplitState nvarchar(255);

select		distinct(soldasvacant), count(soldasvacant)
 from		PortfolioProject.dbo.NashvilleHousing
 group by	SoldAsVacant
 order by	2

 select			SoldAsVacant
 ,case when		SoldAsVacant = 'Y' then 'Yes'
	   when		SoldAsVacant = 'N' then 'No'
	   else		SoldAsVacant
	   end
 from			PortfolioProject.dbo.NashvilleHousing

 update PortfolioProject.dbo.NashvilleHousing
 set SoldAsVacant = case when		SoldAsVacant = 'Y' then 'Yes'
	   when		SoldAsVacant = 'N' then 'No'
	   else		SoldAsVacant
	   end

 alter table PortfolioProject.dbo.NashvilleHousing
 drop column propertyAddress, saledate, taxdistrict

 select *
 from PortfolioProject.dbo.NashvilleHousing
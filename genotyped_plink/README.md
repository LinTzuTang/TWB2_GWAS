# TWB2
### 1.keep TWB2 ID in lab_info
```
~/plink --bfile TWB2.hg38 --keep TWB2_id.txt --make-bed --out TWB2
```
686,439 variants and 88,339 people 
### 2. keep only biallelic variants (remove multiallelic variants)
```
~/plink --bfile TWB2 --snps-only 'just-acgt' --biallelic-only --make-bed --out TWB2_bi
```
639,966 variants and 88,339 people

### sex check 
```
~/plink --bfile TWB2_bi --check-sex --out check_sex
```

### 3.  keep only autosomal and sex chromosome (remove non-autosomal chromosomes)
```
~/plink --bfile TWB2_bi --chr 1-22, XY --out TWB2_bi_chr --make-bed
```
603,915 variants and 88,339 people
### missing report 
```
~/plink --bfile TWB2_bi_chr --missing --out missing
```

### 4. quality control
remove samples with sex problems (180 people removed)
filters out all samples with missing call rates exceeding 0.05 (24 people removed)
filters out all variants with missing call rates exceeding 0.01 (66,200 variants removed)
filters out all variants with minor allele frequency 0.01 (100,451 variants removed)
```
 ~/plink --bfile TWB2_bi_chr --remove sex_problem_id.txt --mind 0.05 --geno 0.01 --maf 0.01 --make-bed --out TWB2_cleaned
```

### 5. keep samples with hear losing values 
```
~/plink --bfile TWB2_cleaned --keep hear_lossing_id.txt --out hear_lossing --make-bed
```

### 6. quantitative trait association
```
~/plink --bfile hear_lossing --assoc --pheno hear_losing.pheno --out hear_losing
```

### 7. extract top 500 SNPs
```
~/plink --bfile hear_lossing --extract top_500_hear_losing_snp_id.txt --out hear_losing_top_500 --recode --tab
```
### 8. extract top 5000 SNPs
```
~/plink --bfile hear_lossing --extract top_5000_hear_losing_snp_id.txt --out hear_losing_top_5000 --recode --tab
```

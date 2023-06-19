# R_study

## Calibration_curve.R(薬理学)
薬物の血中濃度の測定に利用する検量線のプロットをする

使用薬物：sulfamethizole
### 検量線の回帰直線の求め方
最小二乗法を利用する。
$$m=\frac{\sum(x)\sum(xy)-n \sum(xy)}{[\sum(x)]^2-n\sum(x^2)} $$

$$ b=\frac{\sum(x)\sum(xy)-\sum(x^2)\sum y}{[\sum(x)]^2-n \sum(x^2)}$$


## blood_concentration.R
吸光度から血中濃度を求める計算を行う。

## local_anesthetic.R
実験データで手技の失敗からデータが得られなかった部分を欠損値として扱って、多重代入法で補完する。

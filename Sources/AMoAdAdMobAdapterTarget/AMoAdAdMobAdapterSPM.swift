import AMoAdAdMobAdapter

/// 静的リンク時にアダプタの実装オブジェクトがリンク対象から外れないよう参照を保持する
public enum AMoAdAdMobAdapterSPM {
    public static var adapterClass: AnyClass { GADMediationAdapterAMoAd.self }
}

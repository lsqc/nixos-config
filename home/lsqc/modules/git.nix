{ ... }:

{
  programs.git = {
    enable = true;

    signing = {
      format = "ssh";
      signByDefault = true;

      key = "~/.ssh/id_ed25519_sk";
    };

    settings = {
      user = {
        email = "lsqc@nya.vodka";
        name = "lsqc";
      };
      alias = {
        st = "status -sb";
        c = "commit";
        me = "merge";
        cp = "cherry-pick";
        b = "branch -v";
        co = "checkout";
        shn = "show --name-only";
        pl = "pull";
        ps = "push";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}

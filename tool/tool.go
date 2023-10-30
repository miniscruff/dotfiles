package tool

type GitHub struct {
	Owner string
	Repo  string
}

type App struct {
	Name          string
	GetVersion    string
	LatestVersion string
	TarURL        string
	TarFile       string
	PreTar        string
	PostTar       string
}

type Tool struct {
	AptPackages []string
	Apps        []App
	Upgrades    []string
	GitHub      []GitHub
	Brews       []string
}

func AllTools() ([]Tool, error) {
	return []Tool{
		devtools,
		terminal,
		wm,
	}, nil
}

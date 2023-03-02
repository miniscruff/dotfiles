package tool

type GitHub struct {
	Owner string
	Repo  string
}

type App struct {
	Name          string
	GetVersion    string
	LatestVersion string
	TarUrl        string
	TarFile       string
	PreTar        string
	PostTar       string
}

type Tool struct {
	AptPackages []string
	Apps        []App
	Upgrades    []string
	Aliases     []string
	GitHub      []GitHub
}

func AllTools() ([]Tool, error) {
	return []Tool{
		editor,
		projects,
		terminal,
		wm,
	}, nil
}

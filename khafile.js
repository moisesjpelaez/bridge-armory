const project = new Project("Bridge");
if (Project.platform === "html5" || Project.platform === "html5worker" || Project.platform === "debug-html5") {
    project.addAssets("Data");
    project.addSources("Sources");
}
resolve(project);

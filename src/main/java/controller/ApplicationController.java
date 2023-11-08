package controller;

import context.RequestContext;
import context.ResponseContext;

public interface ApplicationController {
	RequestContext getRequest(Object request);
	ResponseContext handleRequest(RequestContext req, String rootPath);
	void handleResponse(RequestContext req, ResponseContext res);
}
